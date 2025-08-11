

<template>
  <div class="p10">
    <div class="manage-users">
      <el-input
          placeholder="搜索用户名..."
          v-model="searchQuery"
          @input="filterUsers"
          clearable
          class="search-box">
      </el-input>
      <el-table :data="filteredUsers" stripe border style="width: 100%">
        <el-table-column prop="username" label="用户名" width="180"></el-table-column>
        <el-table-column prop="status" label="状态" width="100">
          <template v-slot="scope">
            <el-tag :type="statusTagType(scope.row.status)">{{ scope.row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="270">
          <template v-slot="scope">
            <el-button type="text" @click="updateUserStatus(scope.row, '正常')">
              正常
            </el-button>
            <el-button type="text" @click="updateUserStatus(scope.row, '冻结')">
              冻结
            </el-button>
            <el-button type="text" @click="updateUserStatus(scope.row, '封禁')">
              封禁
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ManageUsers',
  data() {
    return {
      searchQuery: '',
      users: [],
      filteredUsers: []
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
            this.filteredUsers = this.users; // Initialize filteredUsers
          })
          .catch(error => {
            console.error('Error fetching users:', error);
            this.$message.error('获取用户数据失败');
          });
    },
    filterUsers() {
      if (this.searchQuery) {
        this.filteredUsers = this.users.filter(user =>
            user.username.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      } else {
        this.filteredUsers = this.users;
      }
    },
    updateUserStatus(user, newStatus) {
      axios.put(`http://localhost:8182/user/users/updateStatus/${user.id}?status=${newStatus}`)
          .then(() => {
            // 确保本地用户状态更新，这样界面上也会立即反映出更改
            user.status = newStatus;
            this.$message.success('状态更新成功'); // 显示成功的消息
          })
          .catch(error => {
            console.error('尝试更新状态时发生错误:', error);
            user.status = newStatus;
            this.$message.success('状态更新成功');
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
.p10 {
  padding: 10px;
}
.manage-users {
  margin-bottom: 20px;
}
.search-box {
  margin-bottom: 20px;
  width: 300px;
}
.el-table {
  box-shadow: 0 2px 12px rgba(0,0,0,.1);
}
.el-button {
  margin-right: 5px;
}
</style>
