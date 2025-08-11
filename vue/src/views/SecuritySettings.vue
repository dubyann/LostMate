<template>
  <div class="security-settings">
    <el-card>
      <div slot="header" class="clearfix">
         <h1 style="text-align: center;
    padding-bottom: 20px;">安全设置</h1>
        <span></span>
      </div>
      <div class="settings-content" style="    display: flex;
    align-items: center;
    justify-content: center;">
        <div>
          <el-form label-width="100px">
          <el-form-item label="密码长度">
            <el-input-number v-model="settings.passwordLength" :min="6" :max="20"></el-input-number>
          </el-form-item>
          <el-form-item label="二次验证">
            <el-switch v-model="settings.twoFactorAuth"></el-switch>
          </el-form-item>
        </el-form>
        <div  style="    display: flex;
    align-items: center;
    justify-content: center;"><el-button type="primary" style="width: 90%;" @click="saveSettings">保存设置</el-button></div>
        
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'SecuritySettings',
  data() {
    return {
      settings: {
        passwordLength: 8,
        twoFactorAuth: false
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
.security-settings {
  padding: 20px;
}

.settings-content {
  margin-top: 20px;
}
</style>
