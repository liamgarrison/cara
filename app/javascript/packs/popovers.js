const popoverInit =  () => {
  // Select buttons and popover divs
  const searchFilterButtons = document.querySelectorAll('.search-filter-buttons button');
  const searchFilterPopovers = document.querySelectorAll('.search-filter-popovers > div');

  // Iterate through the buttons and add popvers
  searchFilterButtons.forEach((element, index) => {
    const thisPopover = searchFilterPopovers[index];
    console.log(thisPopover)
    $(element).popover({
      content: () => thisPopover,
      html: true,
      trigger: 'click',
      separator: '/'
    })
    $(element).on( () => element.popover('hide'))
  })
}

export { popoverInit }
