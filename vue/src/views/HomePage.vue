<template>
  <div class="p30" >
    <!-- <h1>首页</h1> -->
  <div class="mt-4" id="findPost">
    <el-input
        v-model="input"
        style="max-width: 600px"
        placeholder="输入您想查询的内容"
        class="input-with-select"
    >
      <template #prepend>
        <el-select v-model="select" placeholder="类型" style="width: 115px">
          <el-option label="交友组局" value="交友组局" />
          <el-option label="失物招领" value="失物招领" />
          <el-option label="二手交易" value="二手交易" />
        </el-select>
      </template>
      <template #append>
        <el-button type="primary" icon="Search" @click="findPost"></el-button>
      </template>
    </el-input>
  </div>
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
          style="width: 100px; height: 100px; margin-right: 20px;"
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
  </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "HomePage",
  data() {
    return {
      select: null, // 用于v-model的数据，初始为空
      options: [ // 存储选项的值和对应的placeholder
        { value: '交友组局', placeholder: '交友组局' },
        { value: '失物招领', placeholder: '失物招领' },
        { value: '二手交易', placeholder: '二手交易' }
      ],
      input:'',
      posts: [], // 存储从后端获取的帖子列表
      currentPage: 1, // 当前页码
      pageSize: 6, // 每页显示数量
      total: 0 // 总帖子数量
    };
  },
  computed: {
    placeholder() {
      // 根据当前选择的select值，返回对应的placeholder
      const selectedOption = this.options.find(option => option.value === this.select);
      return selectedOption ? selectedOption.placeholder : '类型';
    }
  },
  watch: {
    select(newVal) {
      // 监听select值的变化，如果需要，可以在这里执行额外的逻辑
    }
  },
  methods: {
    findPost() {
      // 构造查询参数
      const params = {
        title: this.input.trim(), // 确保搜索内容没有前后空格
        category: this.select, // 选中的类型值
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
            console.error('查找帖子出错:', error);
            this.$message.error('请选择类型！');
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
.post-list-container {
  margin: 30px;
}
.post-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.pagination-center {
  display: flex;
  justify-content: center;
  padding: 20px 0; /* 根据需要调整上下方的间距 */
}
.mt-4{
  display: flex;
  align-items:center ;
  justify-content: center;
  margin-top: 20px;
}
.input-with-select .el-input {
  border: 1px solid #dcdfe6;
}

.input-with-select .el-input__inner {
  padding-right: 0;
}

.input-with-select .el-input__prepend {
  border-right: none;
  background-color: #f5f7fa;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}

.input-with-select .el-input__append {
  border-left: none;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}


</style>