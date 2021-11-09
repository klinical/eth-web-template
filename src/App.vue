<template>
  <div id="app">
    <HelloWorld msg="Rabl, powered by Ethereum"/>
  </div>
</template>

<script>
import Web3 from 'web3'
import HelloWorld from './components/HelloWorld.vue'
import detectEthereumProvider from '@metamask/detect-provider'

export default {
  name: 'App',
  components: {
    HelloWorld
  },
  async mounted() {
    const provider = await detectEthereumProvider();

    if (provider) {
      const web3 = new Web3(provider)

      this.$store.commit('set_address', web3)

      try {
        await provider.request({ method: "eth_requestAccounts" })
      } catch ( e ) {
        console.log(e)
      }
    } else {
      console.log("MetaMask and a valid Ethereum wallet are required to use this website.")
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
