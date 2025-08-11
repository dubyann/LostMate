<template>
  <div class="user-messages">
    <el-table :data="messages" stripe border style="width: 100%">
      <el-table-column prop="date" label="日期" width="150" :formatter="formatDate"></el-table-column>
      <el-table-column prop="type" label="类型" width="120" :formatter="formatType"></el-table-column>
      <el-table-column prop="content" label="内容" :show-overflow-tooltip="true"></el-table-column>
      <el-table-column prop="reason" label="未通过原因" v-if="showReasons" :show-overflow-tooltip="true"></el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: 'UserMessages',
  data() {
    return {
      messages: [
        {date: '2023-07-01', type: '发布成功', content: '您的帖子《Vue.js基础》已发布成功！', reason: ''},
        {
          date: '2023-07-02',
          type: '审核未通过',
          content: '您的帖子《Vue.js高级应用》审核未通过。',
          reason: '内容不符合发表标准。'
        },
        {date: '2023-07-03', type: '审核成功', content: '您的帖子《Vue.js项目实战》审核成功并已发布。', reason: ''}
      ],
      showReasons: true
    }
  },
  mounted() {
    this.checkReasons();
  },
  methods: {
    checkReasons() {
      this.showReasons = this.messages.some(message => message.reason);
    },
    formatDate(date) {
      return new Date(date).toLocaleDateString();
    },
    formatType(type) {
      return type === '审核未通过' ? {text: type, type: 'danger'} : {text: type, type: 'success'};
    }
  }
}
</script>

<style scoped>
.user-messages {
  margin: 20px;
}

.el-table .danger {
  color: #f56c6c;
}

.el-table .success {
  color: #67c23a;
}
</style>
