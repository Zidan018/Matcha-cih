const carouselImages = document.getElementById('carousel-images');
const totalImages = carouselImages.children.length;
let index = 0;

function updateCarousel(){
    const offset = -index * 600;
    carouselImages.style.transform = `translateX(${offset}px)`;
}

document.getElementById('nextBtn').addEventListener('click', () => {
    index += 1;
    updateCarousel();
});


document.getElementById('prevBtn').addEventListener('click', () => {
    index -= 1;
    updateCarousel();

});
