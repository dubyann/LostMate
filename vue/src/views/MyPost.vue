<template>
  <div class="p30">
    <div id="mypost">
    <el-table
        :data="posts"
        show-header
        style="width: 100%">
      <el-table-column
          prop="title"
          label="标题"
          width="420">
      </el-table-column>
      <el-table-column
          prop="category"
          label="类型"
          width="220">
      </el-table-column>
      <el-table-column
          prop="status"
          label="状态"
          width="220">
      </el-table-column>
      <el-table-column fixed="right" label="操作" width="320">
        <template #default="{ row }">
          
          <el-button size="" type="text" @click="viewPost(row)"  style="color:#67c23a;">
            <el-icon><View /></el-icon>
            查看</el-button>
          <el-button size="mini" type="text" @click="editPost(row)">
             <el-icon :size="size" :color="color">
      <Edit />
    </el-icon>
            编辑</el-button>
          <el-button size="mini" type="text" @click="deletePost(row)" style="color:#f56c6c;">
            <el-icon><Delete /></el-icon>
            删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "MyPost",
  data(){
    return {
      posts: [], // 存储从后端获取的帖子列表
      currentPage: 1, // 当前页码
      pageSize: 12, // 每页显示数量
      total: 0 // 总帖子数量
    }
  },
  created() {
    this.findPost();
  },
  methods: {
    findPost() {
      // 构造查询参数

      const userId = this.$store.state.user.userId;
      console.log(this.$store.state.user);
      // 发送请求到后端API，使用 params 传递查询参数
      axios.get('http://localhost:8182/post/findByUserId', {
        params: { userId: userId }
      })
          .then(response => {
            // 处理响应数据
            this.posts = response.data;
            // 分页
            this.total = response.data.length;
          })
          .catch(error => {
            // 处理错误情况
            console.error('浏览帖子出错', error);
            this.$message.error('系统出错！请稍后再试');
          });
    },
    handleCurrentChange(val) {
      // 这里可以添加逻辑处理页码变化，例如重新请求数据
      this.currentPage = val;
      this.findPost(); // 重新请求当前页数据
    },
    setCurrentPost(post) {
      this.$store.dispatch('updateCurrentPost', post); // 更新当前选中的帖子
    },
    viewPost(post) {
      // 处理查看帖子的逻辑，使用 post 数据
      console.log('查看帖子：', post);
    },
    editPost(post) {
      // 处理编辑帖子的逻辑，使用 post 数据
      console.log('编辑帖子：', post);
    },
    deletePost(post) {
      // 处理删除帖子的逻辑，使用 post 数据
      console.log('删除帖子：', post);
      // 假设你有一个API调用来删除帖子
      // axios.delete(`/api/posts/${post.id}`);
    }

  }
}
</script>

<style scoped>
 /deep/ .el-table th.el-table__cell {
   height: 50px;
    background: #f5f7fa !important;
  }
</style>