export default function ({ store, redirect }) {
  if (!store.state.auth.loggedIn && process.client) {
    window.alert('ログイン画面を表示します')
    redirect('/login')
  }
}
