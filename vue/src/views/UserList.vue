


<template>
  <div>
    <el-table :data="users" style="width: 100%">
      <el-table-column prop="username" label="用户名" width="180"></el-table-column>
      <el-table-column prop="email" label="电子邮件" width="200"></el-table-column>
      <el-table-column prop="role" label="角色"></el-table-column>
      <el-table-column label="状态">
        <template #default="scope">
          <el-tag :type="statusTagType(scope.row.status)">{{ scope.row.status }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button @click="updateUserStatus(scope.row.userId, '正常')">正常</el-button>
          <el-button @click="updateUserStatus(scope.row.userId, '冻结')">冻结</el-button>
          <el-button @click="updateUserStatus(scope.row.userId, '封禁')">封禁</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'UserList',
  data() {
    return {
      users: []
    };
  },
  created() {
    this.fetchUsers();
  },
  methods: {
    fetchUsers() {
      axios.get('http://localhost:8182/api/users/')
          .then(response => {
            this.users = response.data;
          })
          .catch(error => {
            console.error('Error fetching users:', error);
          });
    },
    // 确保从表格或其他 UI 元素中正确获取 userId
    updateUserStatus(userId, status) {
      if (!userId) {
        console.error("UserId is undefined.");
        return;
      }

      axios.put(`http://localhost:8182/api/users/updateStatus/${userId}`, null, {
        params: { status }
      })
          .then(response => {
            this.$message.success(response.data);
            this.fetchUsers(); // 刷新用户列表
          })
          .catch(error => {
            console.error('Error updating user status:', error);
            this.$message.error('更新用户状态失败');
          });
    },
    statusTagType(status) {
      switch (status) {
        case '正常': return 'success';
        case '冻结': return 'warning';
        case '封禁': return 'danger';
        default: return 'info';
      }
    }
  }
}
</script>

<style scoped>
/* 可以在这里添加一些CSS样式，如果需要 */
</style>

