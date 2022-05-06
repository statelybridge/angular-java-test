import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HomeService } from '../home/home.service';
import { EditService } from './edit.service';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css'],
})
export class EditComponent implements OnInit {
  employees: any;
  categories: any;
  cat_selected: any;
  selected_employee: any;

  constructor(
    private readonly edit_service: EditService,
    private readonly home_service: HomeService,
    private router: Router
  ) {
    this.router.routeReuseStrategy.shouldReuseRoute = () => {
      return false;
    };
  }

  ngOnInit(): void {
    this.home_service.getCategories().then((data: any) => {
      this.categories = data;
      this.cat_selected = data[0]?.id;
    });

    this.edit_service.getEmployees().then((data: any) => {
      this.employees = data;
      this.selected_employee = data[data.length - 1];
    });
  }

  category(cat: any) {
    try {
      this.cat_selected = cat.target.value;
    } catch (error) {
      throw new Error('Error on category Event');
    }
  }

  getName(index: any) {
    return this.employees.find((c: any) => c.id == index);
  }

  employee(event: any) {
    this.selected_employee = this.getName(event.target.value);
  }

  async updateEmployee(name: any) {
    let obj = {
      name: name,
      category: this.cat_selected,
      term: true,
    };
    await this.edit_service.updateEmployee(obj, this.selected_employee?.id);
    this.router.navigateByUrl('/edit');
  }

  isSelected(id: any): boolean {
    return id == this.selected_employee.category;
  }
}
