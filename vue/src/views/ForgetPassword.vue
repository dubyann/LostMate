<template>
  <div class="background">
    <div class="forget-box">
      <el-form label-position="top" ref="forgetPasswordForm" :model="forgetPasswordForm" label-width="60px">
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="forgetPasswordForm.email"></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="password">
          <el-input show-password v-model="forgetPasswordForm.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="r_password">
          <el-input show-password v-model="forgetPasswordForm.r_password" type="password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit('forgetPasswordForm')">重置密码</el-button>
          <router-link to="/" style="margin-left: 10px;">
            <el-link>返回登录界面</el-link>
          </router-link>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "forgetPassword",
  data(){
    return{
      forgetPasswordForm:{
        email:'',
        password:'',
        r_password: ''
      }
    }
  },
  methods: {
    onSubmit(formName) {
      const _this=this
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post('http://localhost:8182/user/resetPassword',this.forgetPasswordForm).then(function (resp){
            if(resp.data=='success'){
              _this.$message({
                message: '密码重置成功！',
                type: 'success'
              });
              _this.$router.push({ name: 'login' });
            } else _this.$message.error('邮箱未注册！');
          })
        } else {
          return false;
        }
      });
    }
  }
}
</script>

<style scoped>
  .background{
    height: 100vh; 
    background-image: url("../assets/02.jpg");
    background-size: cover ;
    display: flex; 
    align-items: center; 
    justify-content: center;
  }

  .forget-box{
    width: 100%;
    max-width: 400px; 
    padding: 20px; 
    border-radius: 25px;
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 10px #000;
  }
</style>