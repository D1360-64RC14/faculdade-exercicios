package parkinglot

import "errors"

type Car struct {
	Plate string
}

type ParkingLot struct {
	size  int
	slots []*Car
}

func New(size int) *ParkingLot {
	return &ParkingLot{
		size,
		make([]*Car, size),
	}
}

func (p *ParkingLot) Add(car Car, slot int) error {
	if !p.IsValidSlot(slot) {
		return errors.New("vaga inválida")
	}

	if p.IsFull() {
		return errors.New("o estacionamento está cheio")
	}

	if p.Has(car) {
		return errors.New("este veículo já está no estacionamento")
	}

	p.slots[slot-1] = &car
	return nil
}

func (p *ParkingLot) Has(car Car) bool {
	for _, sCar := range p.slots {
		if sCar != nil && sCar.Plate == car.Plate {
			return true
		}
	}

	return false
}

func (p *ParkingLot) Release(slot int) error {
	if !p.IsValidSlot(slot) {
		return errors.New("vaga inválida")
	}

	if p.slots[slot-1] == nil {
		return errors.New("não há carros nesta vaga")
	}

	p.slots[slot-1] = nil
	return nil
}

func (p *ParkingLot) IsFull() bool {
	for _, car := range p.slots {
		if car == nil {
			return false
		}
	}

	return true
}

func (p *ParkingLot) IsValidSlot(slot int) bool {
	if slot <= 0 || slot > p.size {
		return false
	}
	return true
}

func (p *ParkingLot) FreeSlots() []int {
	free := make([]int, 0, p.size)

	for i, car := range p.slots {
		if car == nil {
			free = append(free, i+1)
		}
	}

	return free
}

func (p *ParkingLot) OccupiedSlots() []int {
	ocuppied := make([]int, 0, p.size)

	for i, car := range p.slots {
		if car != nil {
			ocuppied = append(ocuppied, i+1)
		}
	}

	return ocuppied
}

func (p *ParkingLot) IsOccupied(slot int) (bool, error) {
	if !p.IsValidSlot(slot) {
		return false, errors.New("vaga inválida")
	}

	return p.slots[slot-1] != nil, nil
}

func (p *ParkingLot) Slots() []*Car {
	return p.slots
}

func (p *ParkingLot) Size() int {
	return p.size
}
