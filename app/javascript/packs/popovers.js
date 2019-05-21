const popoverInit =  () => {
  // Select buttons and popover divs
  const searchFilterButtons = document.querySelectorAll('.search-filter-buttons button');
  const searchFilterPopovers = document.querySelectorAll('.search-filter-popovers > div');

  // Iterate through the buttons and add popvers
  searchFilterButtons.forEach((element, index) => {
    const thisPopover = searchFilterPopovers[index];
    $(element).popover({
      content: thisPopover,
      html: true,
      trigger: 'focus',
      separator: '/',
      container: element
    })
  })
}

export { popoverInit }
