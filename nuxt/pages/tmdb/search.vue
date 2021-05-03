<template>
  <main role="main" class="container">
    <header class="mb-1">
      <h2>TMDb情報検索</h2>
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
        <b-button variant="primary">Save</b-button>
      </b-col>
    </b-form>
    <div>
      ほげほげほげa
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
})
</script>
