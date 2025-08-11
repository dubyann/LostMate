<template>
  <div class="p30">
    <!-- <el-page-header @back="goBack"></el-page-header> -->
    <div>
      <el-form
        :model="postForm"
        ref="postForm"
        label-width="auto"
        label-position="top"
      >
      <el-row>
        <el-col :span="11">
          <el-form-item label="标题" prop="title" style="max-width: 600px">
          <el-input
            v-model="postForm.title"
            clearable
            maxlength="50"
            show-word-limit
          />
        </el-form-item>
        </el-col>
        <el-col :span="11" style="margin-left:30px;">
           <el-form-item label="类型" prop="category" style="max-width: 600px">
          <el-select v-model="postForm.category" placeholder="请选择类型">
            <el-option label="交友组局" value="交友组局" />
            <el-option label="失物招领" value="失物招领" />
            <el-option label="二手交易" value="二手交易" />
          </el-select>
        </el-form-item>
        </el-col>
      </el-row>
 <el-row>
        <el-col :span="24">
          <el-form-item label="正文">
          <div id="editor" style="width:94%"></div>
        </el-form-item>

           </el-col>
      </el-row>
      
        
       
        <el-form-item label="封面" style="max-width: 600px">
          <el-upload
            class="avatar-uploader"
            action="http://localhost:8182/upload/image"
            :show-file-list="false"
            accept=".jpg,.png"
            :on-success="handleAvatarSuccess"
            clearFiles
            :before-upload="beforeAvatarUpload"
            name="file"
          >
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
          </el-upload>
        </el-form-item>

        
        <el-form-item>
          <el-button type="primary" @click="onSubmit">发布</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { UploadFilled } from "@element-plus/icons-vue";
import E from "wangeditor";
export default {
  name: "WritePost",
  data() {
    return {
      postForm: {
        title: "",
        category: "",
        image_url: "",
        content: "",
        userId: this.$store.state.user.userId,
      },
      imageUrl: "",
      editor: null,
    };
  },
  created() {
    this.$nextTick(() => {
      this.editor = new E("#editor");
      this.editor.create();
    });
  },
  methods: {
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.postForm.image_url = res; // 用于表单提交
      this.$message({
        message: "上传成功！",
        type: "success",
      });
      console.log(res);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg" || file.type === "image/png";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG/PNG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    onSubmit() {
      console.log(this.postForm);
      const _this = this;
      let content = this.editor.txt.html();
      this.postForm.content = content;
      this.$refs.postForm.validate((valid) => {
        if (valid) {
          axios
            .post("http://localhost:8182/post/addPost", this.postForm)
            .then(function (resp) {
              if (resp.data != null) {
                _this.$message({
                  message: "发布成功！待审核",
                  type: "success",
                });
                console.log(resp);
              // 清空表单数据
              _this.postForm.title = '';
              _this.postForm.category = '';
              _this.postForm.image_url = '';
              _this.postForm.content = '';

               // 清空图片显示
              _this.imageUrl = '';

              //刷新富文本编辑器
              _this. editor.destroy();
              _this.$nextTick(() =>{
                _this.editor=new E('#editor')
                _this.editor.create()
              })


            }
            else _this.$message.error('操作失败！');
          })
        } else {
          return false;
        }
      });
    },
    goBack() {
      this.$router.go(-1); // 返回到上一个页面
    },
  },
};
</script>

<style scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>