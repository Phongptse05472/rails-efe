const CourseStore = {
    namespaced: true,
    state: {
        courses: [],
        course: {}
    },
    mutations: {
        one(state, data) {
            state.course = data.course;
            return state;
        },
        many(state, data) {
            state.courses= data.courses;
            return state;
        }
    },
    actions: {
        index(context, query) {
            $.ajax({
                url: `courses`,
                type: 'get',
                data: query,
                success: function(data) {
                    context.commit('many', data)
                }
            })
        },
        show(context, id) {
            $.ajax({
                url: `courses/${id}`,
                type: 'get',
                success: function(data) {
                    context.commit('one', data)
                }
            })
        },
    }
};

export default CourseStore;
