import Lightpick from 'lightpick'

const lightpickInitVehicleIndex = () => {
  const picker = new Lightpick({
    field: document.getElementById('start_date'),
    secondField: document.getElementById('end_date'),
    singleDate: false,
    selectForward: true,
    inline:true,
    numberOfColumns: 2,
    numberOfMonths: 2
  });
};

export { lightpickInitVehicleIndex }
