
export default {
    state: {
        web3: null,
        accounts: null,
    },
    mutations: {
        set_address(state, web3) {
            state.web3 = web3
        },
        set_accounts(state, accounts) {
            state.accounts = accounts
        }
    }
}
