<template>
  <div class="container">
    <div class="header">
      <div class=image1>
        <img src="IMG_1684.jpeg" width="210px" height="100px">
      </div>
    </div>
    <el-row  :gutter="24">
      <el-col :span="6">
        <div class="aaa">
          <div class="grid-content" style="padding: 10px; margin-bottom: 10px; border: 5px double #333333;">
            検索窓
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content6">
          <el-radio-group v-model='radio1'>
          <router-link to="/">
          <el-radio-button label="チャンネル"></el-radio-button>
          </router-link>
          <router-link to="/top_movie">
          <el-radio-button label="動画"></el-radio-button>
          </router-link>
          </el-radio-group>
        </div>
      </el-col>
      <el-col :span="18">
        <div class="grid-content2">
          <el-radio-group v-model="radio2">
            <el-radio-button label="カテゴリ1"></el-radio-button>
            <el-radio-button label="カテゴリ2"></el-radio-button>
            <el-radio-button label="カテゴリ3"></el-radio-button>
            <el-radio-button label="カテゴリ4"></el-radio-button>
            <el-radio-button label="カテゴリ5"></el-radio-button>
            <el-radio-button label="カテゴリ6"></el-radio-button>
            <el-radio-button label="カテゴリ7"></el-radio-button>
            <el-radio-button label="カテゴリ8"></el-radio-button>
            <el-radio-button label="カテゴリ9"></el-radio-button>
            <el-radio-button label="カテゴリ10"></el-radio-button>
            <el-radio-button label="カテゴリ11"></el-radio-button>
            <el-radio-button label="カテゴリ12"></el-radio-button>
            <el-radio-button label="カテゴリ13"></el-radio-button>
            <el-radio-button label="カテゴリ14"></el-radio-button>
          </el-radio-group>
        </div>
        <el-col :span="12">
          <div class="bbb">
          <div class="grid-content3" style="margin-bottom: 400px; border: 5px double #333333;">
            高評価
          </div>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="ccc">
          <div class="grid-content4" style="margin-bottom: 400px; border: 5px double #333333;">
            再生数
          </div>
          </div>
        </el-col>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data () {
    return {
      radio1: '動画',
      radio2: 'カテゴリ1'
    }
  }
}
</script>

<style>
.header{
  margin-top:10px;
  filter: brightness(100%);
  }
.grid-content{
  height:790px;
}
.ccc{
  width:70pxpx;
}
.ddd{
  width:70px;
}
.grid-content2{
  margin-top: 20px;
  margin-right: 20px;
}
.grid-content3{
  height:600px;
  margin-top:50px;
}
.grid-content4{
  height:600px;
  margin-top:50px;
}
.el-radio-group1{
  width:100px;
}
</style>
