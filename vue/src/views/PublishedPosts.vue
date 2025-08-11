<!--
<template>
  <div class="published-posts">
    <el-card>
      <div slot="header" class="clearfix">
        <span>已发布的帖子</span>
      </div>
      <el-table :data="posts" stripe border style="width: 100%">
        <el-table-column prop="title" label="帖子标题" width="180"></el-table-column>
        <el-table-column prop="author" label="作者" width="120"></el-table-column>
        <el-table-column prop="createdAt" label="发布日期" width="150"></el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'PublishedPosts',
  data() {
    return {
      posts: []
    };
  },
  created() {
    this.fetchPublishedPosts();
  },
  methods: {
    fetchPublishedPosts() {
      axios.get('http://localhost:8182/api/posts/published')
          .then(response => {
            console.log(response.data); // 打印数据，确保结构正确
            this.posts = response.data.map(post => ({
              title: post.title,
              author: post.author ? post.author.username : '未知', // 确保 author 存在
              createdAt: post.created_at ? post.created_at : '空白' // 提供默认值为“空白”如果日期不存在
            }));
          })
          .catch(error => {
            console.error('Error fetching published posts:', error);
            this.$message.error('获取已发布帖子数据失败');
          });
    }
  }
}
</script>

<style scoped>
.published-posts {
  padding: 20px;
}
.el-card {
  margin-bottom: 20px;
}
.el-table {
  margin-top: 20px;
}
</style>
-->



<template>
  <!-- <div class="published-posts">
    <el-card>
      <div slot="header" class="clearfix">
        <span>已发布的帖子</span>
      </div>
      <el-table :data="posts" stripe border style="width: 100%">
        <el-table-column prop="title" label="帖子标题" width="180"></el-table-column>
        <el-table-column prop="author" label="作者" width="120"></el-table-column>
        <el-table-column prop="createdAt" label="发布日期" width="150"></el-table-column>
      </el-table>
    </el-card> -->
    <div class="p10">
 <el-table :data="posts" style="width: 100%">
        <el-table-column prop="title" label="帖子标题" width=""></el-table-column>
        <el-table-column prop="author" label="作者" width=""></el-table-column>
        <el-table-column prop="createdAt" label="发布日期" width="150"></el-table-column>
      </el-table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'PublishedPosts',
  data() {
    return {
      posts: []
    };
  },
  created() {
    this.fetchPublishedPosts();
  },
  methods: {
    fetchPublishedPosts() {
      axios.get('http://localhost:8182/api/posts/published')
          .then(response => {
            console.log(response.data);
            this.posts = response.data.map(post => ({
              title: post.title,
              author: post.author ? post.author.username : '未知',
              createdAt: post.createdAt ? new Date(post.createdAt).toLocaleDateString() : '空白'
            }));
          })
          .catch(error => {
            console.error('Error fetching published posts:', error);
            this.$message.error('获取已发布帖子数据失败');
          });
    }
  }
}
</script>

<style scoped>
.published-posts {
  padding: 20px;
}
.el-card {
  /* margin-bottom: 20px; */
}
.el-table {
  /* margin-top: 20px; */
}
/deep/ .el-table th.el-table__cell {
   height: 50px;
    background: #f5f7fa !important;
  }
</style>
