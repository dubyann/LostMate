<template>
<div class="p30">
  <div class="user-info">
    <el-card class="box-card" shadow="hover">
      <h2 style="    padding-bottom: 20px;
    text-align: center;">编辑个人信息</h2>
      <el-form ref="userInfoForm" :model="userInfo" label-width="150px">
        <!-- 头像上传 -->
        <el-form-item label="头像" class="form-item">
          <el-upload
              class="avatar-uploader"
              action="http://localhost:8182/upload/image"
              :show-file-list="false"
              accept=".jpg,.png"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
              name="file"
          >
            <img v-if="avatar" :src="avatar" class="avatar">
             <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
            <!-- <el-button size="small" class="upload-button">点击上传</el-button> -->
          </el-upload>
        </el-form-item>

        <el-form-item label="手机号" class="form-item">
          <el-input v-model="userInfo.phone" placeholder="请输入手机号"></el-input>
        </el-form-item>
        <el-form-item label="住址" class="form-item">
          <el-input v-model="userInfo.address" placeholder="请输入住址"></el-input>
        </el-form-item>
        <el-form-item label="生日" class="form-item">
          <el-date-picker v-model="userInfo.birthday" type="date" placeholder="选择日期" start-placeholder="开始日期" end-placeholder="结束日期" align="right"></el-date-picker>
        </el-form-item>
        <el-form-item class="form-item">
          <el-button type="primary" @click="submitForm" class="submit-button">保存修改</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
  </div>
</template>

<script>
export default {
  name: 'UserInfo',
  data() {
    return {
      userInfo: {
        avatar: '',
        phone: '',
        address: '',
        birthday: null
      },
      avatar: ''  // 存储头像的URL
    };
  },
  methods: {
    handleAvatarSuccess(response, file) {
      // 假设后端返回的是一个包含URL的对象 { url: 'path/to/image.jpg' }
      this.avatar = response.url; // 更新avatar的URL
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 或 PNG 格式!');
        return false;
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
        return false;
      }
      return isJPG && isLt2M;
    },
    submitForm() {
      this.$refs.userInfoForm.validate(valid => {
        if (valid) {
          console.log('submit!', this.userInfo);
          // 在这里可以添加API调用，提交用户信息更新
        } else {
          console.log('验证失败!');
        }
      });
    }
  }
}
</script>

<style scoped>
.user-info {
  display: flex;
  justify-content: center;
  padding: 30px;
  background-color: #f5f5f5;
}
.box-card {
  width: 100%;
  max-width: 700px;
  padding: 25px;
  border-radius: 8px;
  /* box-shadow: 0 4px 6px rgba(0,0,0,0.1); */
}
.form-item {
  margin-bottom: 15px;
}
.avatar-uploader {
  cursor: pointer;
  position: relative;
  /* border: 1px dashed #dcdfe6;
  border-radius: 6px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px; */
}
.el-date-editor.el-input, .el-date-editor.el-input__wrapper{
  width: 100% !important;
}
.el-icon.avatar-uploader-icon{
  width: 100px !important;
  height: 100px !important;
}
.avatar {
  max-width: 100px;
  max-height: 100px;
  border-radius: 50%;
}
.upload-button {
  margin-left: 10px;
  color: #606266;
}
.submit-button {
  width: 100%;
}
</style>
