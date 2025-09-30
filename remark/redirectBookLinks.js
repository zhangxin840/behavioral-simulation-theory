function rewrite(node) {
  if (!node || typeof node !== 'object') {
    return;
  }

  if (node.type === 'link') {
    if (node.url === './book-structure.md' || node.url === 'book-structure.md') {
      node.url = '/book-structure';
    }
    if (node.url === './writing-style-guide.md' || node.url === 'writing-style-guide.md') {
      node.url = '/writing-style-guide';
    }
  }

  if (Array.isArray(node.children)) {
    node.children.forEach(rewrite);
  }
}

module.exports = function redirectBookLinks() {
  return (tree) => rewrite(tree);
};
