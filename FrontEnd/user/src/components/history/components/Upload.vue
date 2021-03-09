<template>
  <div class="upload">
    <input
      type="file"
      id="fileExport"
      @change="handleFileChange"
      ref="inputer"
    />
  </div>
</template>

<script>
export default {
  props: ["data"],
  data() {
    return {
      file: null,
      formData: null,
    };
  },
  methods: {
    handleFileChange(e) {
      console.log(this.data);
      let inputDOM = this.$refs.inputer;
      this.file = inputDOM.files[0]; // 通过DOM取文件数据
      let size = Math.floor(this.file.size / 1024); //计算文件的大小
      this.formData = new FormData(); //new一个formData事件
      this.formData.append("file", this.file); //将file属性添加到formData里 //此时formData就是我们要向后台传的参数了
      this.$http({
        url: `/file/upload/${this.data.applicationId}`,
        data: this.formData, //在此处上传文件
        method: "post",
        // 　　　　headers:{
        // 　　　　　　'Content-Type':'multipart/form-data' //值得注意的是，这个地方一定要把请求头更改一下
        // 　　　　}
      })
        .then((res)=>{
          console.log(res, "此处应该是请求成功的回调");
          this.$message.success("上传成功");
        })
        .catch((req)=>{
          console.log(req, "请求失败的回调，自己看看为啥失败");
          this.$message.error("上传失败");
        });
    },
  },
};
</script>

<style>


</style>