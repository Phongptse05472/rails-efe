new Vue({
    el: '#top',
    data: {
        courses: [
            { image: '../images/khoa_Hoc4.png', icon: '../image/2.jpg', author: 'Trịnh Hoàn', title: 'Thiết kế Website bán hàng 1' },
            { image: '../images/code_c.PNG', icon: '../image/2.jpg', author: 'Long ca', title: 'Thiết kế Website bán hàng 2' },
            { image: '../images/japanese.png', icon: '../image/2.jpg', author: 'Huấn Hoa Hồng', title: 'Thiết kế Website bán hàng 3' },
            { image: '../images/java.png', icon: '../image/2.jpg', author: 'Sơn tùng', title: 'Thiết kế Website bán hàng 4' },
            { image: '../images/java_script.jpg', icon: '../image/2.jpg', author: 'Hiếu cubin', title: 'Thiết kế Website bán hàng 5' }
        ]
    }
});
// new Vue({
//     el: '#top',
//     data: {
//         courses: []
//     },
//     mounted: function () {
//         axios.get('../json/hot.json')
//             .then(response => {
//                 this.courses = response.data;
//                 console.log(response);
//             })
//             .catch(error => {
//                 console.log(error);
//             });
//     }
// });
new Vue({
    el: '#topView',
    data: {
        courses: []
    },
    mounted: function() {
        axios.get('../json/hot.json')
            .then(response => {
                this.courses = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
})
new Vue({
    el: '#free',
    data: {
        courses: []
    },
    mounted: function() {
        axios.get('../json/hot.json')
            .then(response => {
                this.courses = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
});
new Vue({
    el: '#new',
    data: {
        courses: []
    },
    mounted: function() {
        axios.get('../json/hot.json')
            .then(response => {
                this.courses = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
});
new Vue({
    el: '#app1',
    data: {
        courses: []
    },
    mounted: function() {
        axios.get('../json/hot.json')
            .then(response => {
                this.courses = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
});
new Vue({
    el: '#topic',
    data: {
        topics: []
    },
    mounted: function() {
        axios.get('../json/topic.json')
            .then(response => {
                this.topics = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
});
new Vue({
    el: '#topicSide',
    data: {
        topics: []
    },
    mounted: function() {
        axios.get('../json/topic.json')
            .then(response => {
                this.topics = response.data;
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            });
    }
});