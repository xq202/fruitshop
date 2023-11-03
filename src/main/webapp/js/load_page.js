setTimeout(
    () => {
        document.querySelector('.than-website').style.display = 'none';
        document.querySelector('.load-truoc-khi-vao-trang').style.display = 'flex';
        setTimeout(
            () => {
                document.querySelector('.than-website').style.display = 'block';
                document.querySelector('.load-truoc-khi-vao-trang').style.display = 'none';
            },1200
        )
    },0
)