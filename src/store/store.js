
export default {
    state: {
        web3: null
    },
    mutations: {
        set_address (state, _web3) {
            state.web3 = _web3
        }
    }
}
