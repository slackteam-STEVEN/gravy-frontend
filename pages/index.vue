<template>
  <div class='container'>
    <div class='header' style='background-color:#303133;'>Gravy</div>
    <div style="margin-left:2%; margin-right:2%;">
      <el-row :gutter="8">
        <div style='margin-top:30px;'>検索条件</div>
      </el-row>
      <el-row :gutter='2'>
        <el-col :span='8'>
          <div class='aaa'>
            <div class='grid-content' style='margin-top:10px;'>
              <div class='block'>
                <el-date-picker
                  @change='get_date'
                  v-model='value1'
                  type='datetimerange'
                  format='yyyy/MM/dd HH:mm:ss'
                  range-separator='~'
                  start-placeholder='start_created_at'
                  end-placeholder='end_created_at'
                ></el-date-picker>
              </div>
            </div>
          </div>
        </el-col>
        <el-col :span='4'>
          <div class='grid-content6' style='margin-top:10px;'>
            <el-radio-group v-model='radio1'>
              <router-link to='/'>
                <el-radio-button label='チャンネル'></el-radio-button>
              </router-link>
              <router-link to='/top_movie1'>
                <el-radio-button label='動画'></el-radio-button>
              </router-link>
            </el-radio-group>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter='12'>
        <el-col :span='24'>
          <el-col :span='12'>
            <div class='bbb'>
              <div class='grid-content3'>
                <div class='block'>
                  <p>チャンネル登録者数Top50</p>
                  <el-table :data='channel_data_result_subscriber' style='width: 100%'>
                    <el-table-column>
                      <template slot-scope='scope'>
                        <el-col :span='8'>
                          <div class='test'>
                          <a :href= 'scope.row.url'>
                            <img :src= 'scope.row.thumbnail_url' width='100' height='100' />
                          </a>
                          </div>
                        </el-col>
                        <el-col :span='16'>
                          <el-row :guitter='6'>
                            <div>チャンネル名:{{scope.row.title}}</div>
                          </el-row>
                          <el-row :guitter='6'>
                            <div>登録者数:{{scope.row.subscribers}}</div>
                          </el-row>
                          <el-row :guitter='6'>
                            <div>再生数:{{scope.row.view_count}}</div>
                          </el-row>
                          <el-row :guitter='6'>
                            <div>チャンネル開設日:{{scope.row.post_date.split("T")[0]}}</div>
                          </el-row>
                        </el-col>
                      </template>
                    </el-table-column>
                  </el-table>
                </div>
              </div>
            </div>
          </el-col>
          <el-col :span='12'>
            <div class='ccc'>
              <div class='grid-content4'>
                <p>再生数Top50</p>
                <el-table :data='channel_data_result_view' style='width: 100%'>
                  <el-table-column>
                    <template slot-scope='scope'>
                      <el-col :span='8'>
                        <div class='test'>
                        <a :href= 'scope.row.url'>
                          <img :src= 'scope.row.thumbnail_url' width='100' height='100' />
                        </a>
                        </div>
                      </el-col>
                      <el-col :span='16'>
                        <el-row :guitter='6'>
                          <div>チャンネル名:{{scope.row.title}}</div>
                        </el-row>
                        <el-row :guitter='6'>
                          <div>登録者数:{{scope.row.subscribers}}</div>
                        </el-row>
                        <el-row :guitter='6'>
                          <div>再生数:{{scope.row.view_count}}</div>
                        </el-row>
                        <el-row :guitter='6'>
                          <div>チャンネル開設日:{{scope.row.post_date.split("T")[0]}}</div>
                        </el-row>
                      </el-col>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </div>
          </el-col>
        </el-col>
      </el-row>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  methods: {
    async get_date () {
      const self = this
      const params = new URLSearchParams()
      params.append(
        'start_created_at',
        this.value1[0].toLocaleDateString() +
          ' ' +
          this.value1[0].toLocaleTimeString()
      )
      params.append(
        'end_created_at',
        this.value1[1].toLocaleDateString() +
          ' ' +
          this.value1[1].toLocaleTimeString()
      )
      await axios
        .post(process.env.BACKEND_CREATE_URL + 'channel', params)
        .then(function (response) {
          console.log(response)
          // responce.date=Flaskから返された返り値
          // Flaskの返り値をbackend_getに格納
          response.data.sort(function (a, b) {
            if (a.subscribers !== b.subscribers) {
              return (a.subscribers - b.subscribers) * -1
            }
            return 0
          })
          self.channel_data_result_subscriber = [...new Map(response.data.map(v => [v.url, v])).values()]
          self.channel_data_result_subscriber = self.channel_data_result_subscriber.slice(0, 50)
          console.log(self.channel_data_result_subscriber)
        })
        .catch(function (error) {
          console.log(error)
          return error
        })
      await axios
        .post(process.env.BACKEND_CREATE_URL + 'channel', params)
        .then(function (response) {
          console.log(response)
          // responce.date=Flaskから返された返り値
          // Flaskの返り値をbackend_getに格納
          response.data.sort(function (a, b) {
            if (a.view_count !== b.view_count) {
              return (a.view_count - b.view_count) * -1
            }
            return 0
          })
          self.channel_data_result_view = [...new Map(response.data.map(v => [v.url, v])).values()]
          self.channel_data_result_view = self.channel_data_result_view.slice(0, 50)
        })
        .catch(function (error) {
          console.log(error)
          return error
        })
    },
    test () {
      console.log()
      console.log(typeof this.value1[1])
    }
  },
  data () {
    return {
      radio1: 'チャンネル',
      channel_data_result_view: [],
      channel_data_result_subscriber: [],
      pickerOptions: {
        shortcuts: [
          {
            text: 'Last week',
            onClick (picker) {
              const end = new Date()
              const start = new Date()
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
              picker.$emit('pick', [start, end])
            }
          },
          {
            text: 'Last month',
            onClick (picker) {
              const end = new Date()
              const start = new Date()
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
              picker.$emit('pick', [start, end])
            }
          }
        ]
      },
      value1: [new Date(), new Date()]
    }
  },
  async mounted () {
    // thisをmounted内で使用できるようにするため。
    // const self = this
    // await axios({
    //   data: {
    //     end_created_at: '',
    //     start_created_at: ''
    //   },
    //   method: 'POST',
    //   url: process.env.BACKEND_CREATE_URL + 'channel',
    //   headers: {
    //     'Content-Type': 'application/json'
    //   },
    // responceにFlaskから帰ってきたデータが返される。
    // .then＝axiosが成功した場合
    // .catch=axiosが失敗した場合
    const params = new URLSearchParams()
    params.append(
      'start_created_at',
      this.value1[0].toLocaleDateString() +
        ' ' +
        this.value1[0].toLocaleTimeString()
    )
    params.append(
      'end_created_at',
      this.value1[1].toLocaleDateString() +
        ' ' +
        this.value1[1].toLocaleTimeString()
    )
    await axios
      .post(process.env.BACKEND_CREATE_URL + 'channel', params)
      .then(function (response) {
        console.log(response)
        // responce.date=Flaskから返された返り値
        // Flaskの返り値をbackend_getに格納
        console.log(self.channel_data_result)
      })
      .catch(function (error) {
        console.log(error)
        return error
      })
  }
}
</script>
<style>
.header {
  filter: brightness(100%);
  height: 100px;
  color: white;
  font-size: 70px;
  box-shadow: -5px -5px 10px #668ad8 inset;
}
.grid-content {
  border-radius: 30px;
}
.ccc {
  width: 70pxpx;
  border-radius: 30px;
}
.test {
  width: 50%;
  height: auto;
  margin: 0 auto;
}
.ddd {
  width: 70px;
  border-radius: 30px;
}
.grid-content2 {
  margin-top: 20px;
  border-radius: 30px;
}
.grid-content3 {
  height: 700px;
  margin-top: 50px;
  border-radius: 30px;
}
.grid-content4 {
  height: 700px;
  margin-top: 50px;
  border-radius: 30px;
}
.grid-content6 {
  margin-top: 10px;
}
p {
  text-align: center;
}
</style>
