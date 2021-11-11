<template>
  <div id="app">
    <div v-if="isMetaMaskInstalled">
      <div v-if="userLinkedWallet">
        <Board />
      </div>
      <div v-else>
        <p>A linked wallet is required to use this site. This may change in the future.</p>
      </div>
    </div>
    <div v-else>
      <p style="text-align: center;">
        MetaMask is and required to get the full experience of this site (this may change in the future). You may install it for your browser here: 
      </p>
      <a href="https://metamask.io/">https://metamask.io/</a>
    </div>
  </div>
</template>

<script>
import Web3 from 'web3'
import Board from './components/Board.vue'
import detectEthereumProvider from '@metamask/detect-provider'

export default {
  name: 'App',
  components: {
    Board
  },
  data() {
    return {
      loading: true,
      isMetaMaskInstalled: false,
      userLinkedWallet: false,
    }
  },
  async mounted() {
    const { ethereum } = window
    this.isMetaMaskInstalled = Boolean(ethereum && ethereum.isMetaMask)

    if (this.isMetaMaskInstalled) {
      const provider = await detectEthereumProvider();

      if (provider) {
        const web3 = new Web3(provider)

        try {
          const accounts = await provider.request({ method: "eth_requestAccounts" })
          console.log(accounts)

          this.$store.commit('set_address', web3)
          this.$store.commit('set_accounts', accounts)

          this.userLinkedWallet = true
        } catch ( e ) {
          console.log(e)
        }
      } else {
        console.log("MetaMask and a valid Ethereum wallet are required to use this website.")
      }
    }

    this.loading = false
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
