<template>
  <div class="background">
    <div class="register-box">
      <p>欢迎注册</p>
      <el-form label-position="top" ref="registerForm" :model="registerForm" label-width="60px">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="registerForm.username"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="registerForm.email"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input show-password v-model="registerForm.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="r_password">
          <el-input show-password v-model="registerForm.r_password"></el-input>
        </el-form-item>
        <el-form-item label="验证码" prop="captcha">
          <div style="display: flex;width: 100%">
            <el-input style="flex: 1;margin-right: 30px" v-model="registerForm.captcha"></el-input>
            <div style="width: 120px;height: 50px">
              <Captcha ref="captchaRef" @getValue="getValue"></Captcha>
            </div>
          </div>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit('registerForm')">立即注册</el-button>
          <router-link to="/" style="margin-left: 10px;">
            <el-link>返回登陆界面</el-link>
          </router-link>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Register",
  data() {
    return {
      registerForm: {
        username: '',
        email:'',
        password: '',
        r_password:'',
        captcha:''
      }
    }
  },
  methods: {
    onSubmit(formName) {
      const _this=this
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post('http://localhost:8182/user/insertUser',this.registerForm).then(function (resp){
            if(resp.data=='success'){
              _this.$message({
                message: '注册成功！',
                type: 'success'
              });
            }else if(resp.data=='exists'){
              _this.$message.error('用户名已存在！');
            }else _this.$message.error('系统错误！');

          })
        } else {
          return false;
        }
      });

    }
  }
}
</script>
<script setup>
import Captcha from '../components/Captcha.vue';
const getValue=(val)=>{
  console.log('验证码值=',val)
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

  .register-box{
    width: 100%;
    max-width: 400px; 
    padding: 20px; 
    border-radius: 25px;
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 10px #000;
  }

  .register-box p{
    text-align: center;
    font-size: 20px;
    font-family: "宋体";
    font-weight: bold;
  }
</style>