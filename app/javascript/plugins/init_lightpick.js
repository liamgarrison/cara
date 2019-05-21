import Lightpick from 'lightpick'

const lightpickInitVehicleIndex = () => {
  const startDate = document.getElementById('start_date');
  const endDate = document.getElementById('end_date');
  if (startDate && endDate) {
    const picker = new Lightpick({
      field: startDate,
      secondField: endDate,
      singleDate: false,
      selectForward: true,
      inline:true,
      numberOfColumns: 2,
      numberOfMonths: 2,
      tooltipNights: true,
      minDate: new Date(),
      parentEl: '.popover-datepicker'
    });
  }
};

const lightpickInitVehicleShow = () => {
  const startDate = document.getElementById('start_date_show');
  const endDate = document.getElementById('end_date_show');
  if (startDate && endDate) {
    const picker = new Lightpick({
      field: startDate,
      secondField: endDate,
      singleDate: false,
      selectForward: true,
      numberOfColumns: 1,
      numberOfMonths: 1,
      tooltipNights: true,
      minDate: new Date()
    })
  }
};


// const lightpickInitVehicleShow = () => {
//   const picker = new Lightpick({
//     field: document.getElementById('start_date_show'),
//     secondField: document.getElementById('end_date_show'),
//     singleDate: false,
//     selectForward: true,
//     numberOfColumns: 1,
//     numberOfMonths: 1,
//     tooltipNights: true,
//     minDate: new Date(),
//     parentEl: '.popover-datepicker',
//     hideOnBodyClick: true,
//   });
// };

export { lightpickInitVehicleIndex, lightpickInitVehicleShow }
