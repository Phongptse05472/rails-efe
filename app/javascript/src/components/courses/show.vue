<template>
    <layout>
        <div class='col-xs-12'>
            <h2>{{ courses.name }}</h2>
            <ul>
                <li>{{ $t('courses.id') }}: {{ course.id }}</li>
                <li>{{ $t('courses.name') }}: {{ course.name }}</li>
                <li>{{ $t('courses.description') }}: {{  course.description }}</li>
            </ul>
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
            this.$store.dispatch('CourseStore/show', this.$route.params.id)
        }
    }
</script>
