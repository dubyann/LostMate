<template>
  <div class="basic-settings">
    <el-card>
      <div slot="header" class="clearfix">
        <h1 style="text-align: center;
    padding-bottom: 20px;">基本设置</h1>
      </div>
      <div class="settings-content">
        <el-form label-width="100px">
          <el-form-item label="站点名称">
            <el-input v-model="settings.siteName" placeholder="请输入站点名称"></el-input>
          </el-form-item>
          <el-form-item label="管理员邮箱">
            <el-input v-model="settings.adminEmail" placeholder="请输入管理员邮箱"></el-input>
          </el-form-item>
        </el-form>
        <div style="    display: flex;
    align-items: center;
    justify-content: flex-end;">
          <el-button type="primary" @click="saveSettings">保存设置</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'BasicSettings',
  data() {
    return {
      settings: {
        siteName: '',
        adminEmail: ''
      }
    };
  },
  methods: {
    saveSettings() {
      console.log('保存设置:', this.settings);
      // 在这里添加保存设置的逻辑
      this.$message.success('设置已保存');
    }
  }
}
</script>

<style scoped>
.basic-settings {
  padding: 20px;
}

.settings-content {
  margin-top: 20px;
}
</style>
