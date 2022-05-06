import { Injectable } from '@angular/core';
import { HostService } from '../utils/host.service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class HomeService {
  constructor(public hostAddress: HostService, public http: HttpClient) {}

  getCategories() {
    return new Promise<any>((resolve, reject) => {
      this.http
        .get(`${this.hostAddress.getHostIp()}/api/categories`)
        .toPromise()
        .then(async (data: any) => {
          if (data == null) {
            console.log(data);
          }
          await this.formatCategories(data);
          resolve(data);
        })
        .catch((err) => {
          console.log(err);
          reject(err);
        });
    });
  }

  async formatCategories(categories: any) {
    try {
      let arr: any = [];
      await categories.map((obj: any, index: any) => {
        // console.log(obj, index);
        if (obj?.cat_level == 0) {
          obj.level1 = [];
          arr.push(obj);
        }

        if (obj?.cat_level == 1) {
          let index = arr.findIndex((x: any) => x.id === obj?.parent_cat_id);
          obj.level2 = [];
          arr[index].level1.push(obj);
        }

        // if (obj?.cat_level == 2) {
        //   let index = arr.findIndex((x: any) => x.id === obj?.parent_cat_id);
        //   arr[index].sub.push(obj);
        // }

        // if (!arr.includes(obj?.id)) {
        // }
      });
    } catch (error) {
      throw new Error('Error while formating Categories: ' + error);
    }
  }

  addEmployee(employee: any) {
    return new Promise<any>((resolve, reject) => {
      this.http
        .post(`${this.hostAddress.getHostIp()}/api/employees`, employee)
        .toPromise()
        .then(async (data: any) => {
          if (data == null) {
            console.log(data);
          }
          // await this.formatCategories(data);
          resolve(data);
        })
        .catch((err) => {
          console.log(err);
          reject(err);
        });
    });
  }
}
