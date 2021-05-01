<template>
  <div class="container has-text-centered mt-6">
    <div>
      <h1 class="title">sample-nuxt-auth</h1>
      <h2 class="subtitle">マイページ</h2>
      <p>こんにちは、{{famlyName}}さん</p>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  middleware: "auth",
  computed: {
    famlyName() {
      // return this.$auth.loggedIn ? this.$auth.$state.user.nickname : 'ゲスト'
    },
  },
})
</script>
