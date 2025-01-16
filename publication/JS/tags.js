// look for tags
const allTags = new Set();
document.querySelectorAll('.blog-posts .tags').forEach(tagElement => {
    allTags.add(tagElement.textContent.trim());
});

// populate the tags
const tagsFilterContainer = document.getElementById('tags-filter');
allTags.forEach(tag => {
    const label = document.createElement('label');
    label.innerHTML = `<input type="checkbox" class="tag-filter" value="${tag}"> ${tag}`;
    tagsFilterContainer.appendChild(label);
});
// listen for selection of tag
document.querySelectorAll('.tag-filter').forEach(checkbox => {
    checkbox.addEventListener('change', filterPosts);
});
function filterPosts() {
    const selectedTags = Array.from(document.querySelectorAll('.tag-filter:checked'))
                               .map(checkbox => checkbox.value);
    document.querySelectorAll('.blog-posts a').forEach(post => {
        const postTags = Array.from(post.querySelectorAll('.tags'))
                               .map(tag => tag.textContent.trim());
        const isVisible = selectedTags.some(tag => postTags.includes(tag));
        post.style.display = isVisible || selectedTags.length === 0 ? 'block' : 'none';
    });
}