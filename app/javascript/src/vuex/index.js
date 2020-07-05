import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
Vue.use(Vuex);

import CourseStore from './stores/course_store';

const store = new Vuex.Store({
    modules: {
        CourseStore
    }
});

export default store;