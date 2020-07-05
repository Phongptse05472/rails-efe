<template>
    <layout>
        <div class='col-xs-12'>
            <table class='table table-striped table-thin'>
                <thead>
                <tr>
                    <th>{{ $t('courses.id') }}</th>
                    <th>{{ $t('courses.name') }}</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for='course in courses' :key="course.id">
                    <td><router-link :to="{ name: 'course_path', params: {id: course.id} }">{{ course.name }}</router-link></td>
                    <td>{{ course.name }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </layout>
</template>

<script>
    import Layout from '../shared/layout';

    export default {
        components: {
            Layout
        },

        data: function() {
            return this.$store.state.CourseStore;
        },

        mounted: function() {
            this.$store.dispatch('CourseStore/index');
        }
    }
</script>
