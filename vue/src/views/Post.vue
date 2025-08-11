<template>
  <el-page-header @back="goBack"></el-page-header>

  <div>
    <h1>{{ post.title }}</h1>
    <img :src="post.image_url" alt="" />
    <div class="w-e-text">
      <div v-html="post.content"></div>
    </div>

  </div>
</template>

<script>
export default {
  data() {
    return {
      post: {},  // 用于保存当前帖子的详细信息
      postId:''
    };
  },
  computed:{
    post(){
      return this.$store.getters.getCurrentPost;
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1); // 返回到上一个页面
    }
  }
};
</script>

<style scoped>
/* 你的样式 */
</style>