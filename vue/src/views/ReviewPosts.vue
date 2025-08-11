

<template>
  <div class="p10">
    <div class="review-posts">
      <el-table :data="posts" stripe border style="width: 100%">
        <el-table-column prop="title" label="帖子标题" min-width="180px"></el-table-column>
        <el-table-column prop="author.username" label="作者" min-width="120px"></el-table-column>
        <el-table-column label="操作" min-width="200px">
          <template #default="scope">
            <el-button type="text" @click="openReviewForm(scope.row)">
              <el-icon :size="size" :color="color">
                <Edit />
              </el-icon>
              审核
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-dialog title="审核帖子" :visible.sync="isDialogVisible" width="500px">
        <el-form :model="reviewForm" label-width="100px">
          <el-form-item label="审核结果">
            <el-radio-group v-model="reviewForm.status">
              <el-radio label="审核通过" value="审核通过">通过</el-radio>
              <el-radio label="审核未通过" value="审核未通过">未通过</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="原因">
            <el-input type="textarea" v-model="reviewForm.reason" placeholder="请输入审核原因"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="isDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitReview">确认审核</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ReviewPosts',
  data() {
    return {
      posts: [],
      reviewForm: {
        status: '',
        reason: '',
        postId: null
      },
      isDialogVisible: false
    };
  },
  created() {
    this.fetchPosts();
  },
  methods: {
    fetchPosts() {
      axios.get('http://localhost:8182/api/posts/unpublished')
          .then(response => {
            this.posts = response.data.map(post => ({
              ...post,
              author: post.author || { username: '未知作者' }
            }));
          })
          .catch(error => {
            console.error('Error fetching posts:', error);
            this.$message.error('获取帖子数据失败');
          });
    },
    openReviewForm(post) {
      this.reviewForm = { status: '', reason: '', postId: post.id }; // 确保正确的属性名称
      this.isDialogVisible = true;
    },
    submitReview() {
      console.log('Submitting review:', this.reviewForm); // 添加调试日志
      axios.post('http://localhost:8182/api/posts/review', this.reviewForm)
          .then(() => {
            this.$message.success('审核提交成功');
            this.isDialogVisible = false;
            this.fetchPosts(); // 重新获取未发布的帖子列表，以更新界面
            this.$router.push({ name: 'userMessages' }); // 跳转到 UserMessages 页面
          })
          .catch(error => {
            console.error('审核提交失败:', error);
            this.$message.error('审核提交失败');
          });
    }
  }
}
</script>

<style scoped>
.p10 {
  padding: 10px;
}

.review-posts {
  margin-bottom: 20px;
}

.dialog-footer {
  text-align: right;
}

.el-button {
  margin-left: 10px;
}

.el-table th.el-table__cell {
  height: 50px;
  background: #f5f7fa !important;
}
</style>
