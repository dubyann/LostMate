<template>
  <div class="background" >
    <div class="login-box">
      <div class="login-name">
        <span class="name">{{ name }}</span>
      </div>
      <p>欢迎登录</p>
      <el-form label-position="top" ref="loginForm" :model="loginForm" label-width="60px">
        <el-form-item label="用户名" prop="username">
          <el-input  v-model="loginForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input show-password v-model="loginForm.password" type="password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit('loginForm')">立即登录</el-button>
          <router-link to="/register" style="margin-left: 30px;">
            <el-link>前往注册</el-link>
          </router-link>
          <router-link to="/forgetPassword" style="margin-left: 30px;">
            <el-link>忘记密码？</el-link>
          </router-link>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Login",

  data() {
    return {
      name:"缘物校园",
      loginForm: {
        username: '',
        password: ''
      }
    }
  },
  methods: {
    onSubmit(formName) {
      const _this=this
      this.$refs[formName].validate((valid) => {
        if (valid) {
          axios.post('http://localhost:8182/user/login',this.loginForm).then(function (resp){
            if(resp.data!=null&&resp.data !== "") {
              console.log(resp);
              _this.$store.dispatch('updateUser', resp.data);
              if (resp.data.role == "用户") {
                if(resp.data.status=="正常"){
                  _this.$message({
                    message: '用户登录！',
                    type: 'success'
                  });
                  _this.$router.push({name: 'homePage'});
                }else{
                  _this.$message.error('用户被封禁或冻结！')
                }

              } else if (resp.data.role == "管理员") {
                _this.$message({
                  message: '管理员登录！',
                  type: 'success'
                });
                _this.$router.push({name: 'admin'});
              }
            }
            else _this.$message.error('用户名或密码错误！');

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
    width: 100% ;
    background-image: url("../assets/02.jpg");
    background-repeat: no-repeat;
    background-size: cover ;
    display: flex; 
    align-items: center; 
    justify-content: center;
    top: 0;
    left: 0;
  }

  .login-box{
    width: 100%;
    max-width: 400px; 
    padding: 20px; 
    border-radius: 25px;
    background: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 10px #000;
  }

  .login-name{
    width: 200px;
    padding: 20px ;
  }

  .login-box p{
    text-align: center;
    font-size: 20px;
    font-family: "宋体";
    font-weight: bold;
  }
  
</style>