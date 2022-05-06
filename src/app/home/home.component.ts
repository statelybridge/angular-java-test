import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { HomeService } from './home.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  categories: any;
  term_of_condition: any;
  radio_selected: any;
  constructor(
    private readonly home_service: HomeService,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.home_service.getCategories().then((data: any) => {
      this.categories = data;
      this.radio_selected = data[0]?.id;
    });
  }

  addEmployee(name: any) {
    try {
      if (!name || name.length == 0) {
        this.openSnackBar('You must have to enter name');
        return;
      }
      if (!this.term_of_condition) {
        this.openSnackBar('Please agree with our conditions');
      } else {
        this.home_service.addEmployee({
          name: name,
          category: this.radio_selected,
          term: this.term_of_condition,
        });
      }
    } catch (error) {
      throw new Error('Error when adding employee ' + error);
    }
  }

  term(event: any) {
    try {
      console.log(event.target.checked);
      this.term_of_condition = event.target.checked;
    } catch (error) {
      throw new Error('Error on terms Event');
    }
  }

  category(cat: any) {
    try {
      this.radio_selected = cat.target.value;
    } catch (error) {
      throw new Error('Error on category Event');
    }
  }

  openSnackBar(error_message: string) {
    this._snackBar.open(error_message, '');
  }
}
