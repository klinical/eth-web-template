<template>
  <div class="hello">
    <p>Logged in with: {{ $store.state.accounts[0] }}</p>
    <input v-model="message" type="text">
    <button @click="postMessage">Post</button>
  </div>
</template>

<script>

export default {
  name: 'Board',
  props: {
    msg: String
  },
  data() {
    return {
      message: ''
    }
  },
  methods: {
    postMessage() {
      console.log('posted', this.message)
    }
  },
  async mounted() {
    
  }
}
</script>


<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
