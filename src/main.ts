import Vue from 'vue'

import App from './App.vue'
import routes from './router/routes'
import store from './store/store'

import VueRouter from 'vue-router'
import Vuex from 'vuex'

Vue.use(Vuex)
Vue.use(VueRouter)

Vue.config.productionTip = false

new Vue({
  router: new VueRouter(routes),
  store: new Vuex.Store(store),
  render: h => h(App),
}).$mount('#app')
