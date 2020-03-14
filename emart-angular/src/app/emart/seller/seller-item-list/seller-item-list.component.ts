import { Component, OnInit } from '@angular/core';
import { EmartService } from 'src/app/emart.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-seller-item-list',
  templateUrl: './seller-item-list.component.html',
  styleUrls: ['./seller-item-list.component.css']
})
export class SellerItemListComponent implements OnInit {
  allSitems:any;
  constructor(protected emartService: EmartService,
    protected router: Router) { }

  ngOnInit(): void {
    
    this.emartService.getAllSItems().subscribe(
      (response: any) => {
       
        this.allSitems = response;
        console.log(this.allSitems)
      }
    );
  }
/*edit(itemId: number){
  this.router.navigate(['item-edit'+itemId]);
}*/

}
