<template>
  <main role="main" class="container">
    <header class="mb-1">
      <h2>Store Index</h2>
    </header>
    <b-form inline>
      <label class="sr-only" for="inline-form-input-name">キーワード</label>
      <b-form-input
        id="inline-form-input-name"
        class="col-4"
        placeholder="キーワード"
        v-model="query.keyword"
      />
      <b-col cols="2">
        <b-button variant="primary" @click="search">検索</b-button>
      </b-col>
    </b-form>
    <div>
      ほげほげほげaabcdeefgaaa
    </div>
  </main>
</template>

<script>
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      query: {
        keyword: "hoge2"
      }
    }
  },
  computed: {
    famlyName() {

    },
  },

  methods: {
    search({ params}) {
      console.log(params)
      this.$axios.get('/hoge')

    }
  }
})
</script>
