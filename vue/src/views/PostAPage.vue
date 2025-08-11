<template>
<div class="p30">
  <div class="post-list-container">
    <!-- 搜索框和按钮保持不变 -->
    <div class="post-list">
      <router-link
          v-for="post in posts"
          :to="{ name: 'post', params: { postId: post.post_id } }"
          tag="el-card"
          :key="post.post_id"
          style="max-width: 480px; margin-bottom: 20px; display: flex;"
          @click.native="setCurrentPost(post)"
      >
        <img
            :src="post.image_url"
            alt=""
            class="image_url"
           
        />
        <div style="flex-grow: 1;">
          <div>{{ post.title }}</div>
          <!-- 这里可以添加更多帖子信息，比如摘要、发布日期等 -->
        </div>
      </router-link>
    </div>
    <!-- 分页控件 -->
    <el-pagination
        background
        class="pagination-center"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pageSize"
        layout="prev, pager, next, jumper"
        :total="total"
    >
    </el-pagination>
  </div></div>
</template>

<script>
import axios from 'axios';
export default {
  name: "PostAPage",
  data(){
    return {
      posts: [], // 存储从后端获取的帖子列表
      currentPage: 1, // 当前页码
      pageSize: 6, // 每页显示数量
      total: 0 // 总帖子数量
    };
  },
  created() {
    this.findPost();
  },
  methods: {
    findPost() {
      // 构造查询参数
      const params = {
        title: '', // 空的关键字表示不进行模糊查询
        category: '交友组局', // 直接写死，方便点
      };

      // 发送请求到后端API
      axios.get('http://localhost:8182/post/search', {params})
          .then(response => {
            // 处理响应数据
            this.posts=response.data;
            //分页
            this.total=response.data.length;
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
    }

  }
}
</script>

<style scoped>
.image_url{
  border: 1px solid #eee;
  width: 100px;
  height: 100px;
  object-fit: cover;
  margin-right: 20px;
}
a{
  display: flex;
  align-items: center;
  color: #333;
  text-decoration: none;

}

</style>