import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Buyer } from '../../Buyer';
import { EmartService } from 'src/app/emart.service';

@Component({
  selector: 'app-buyer-signup',
  templateUrl: './buyer-signup.component.html',
  styleUrls: ['./buyer-signup.component.css']
})
export class BuyerSignupComponent implements OnInit {
  busername: string = '';
  bpassword: string = '';
  bemail: string = '';
  bmobile: number;
  bdate: Date;
  buyers: any;

  constructor(protected router: Router, protected emartService: EmartService) { }

  ngOnInit(): void {
  }
  addBuyer() {

    let buyer: Buyer = {
      id: 0,
      username: this.busername,
      password: this.bpassword,
      email: this.bemail,
      mobile: this.bmobile,
      date: this.bdate

    };

    this.emartService.addBuyer(buyer).subscribe(
      (response: any) => {

      }
    );

    this.router.navigate(['']);
  }
}
