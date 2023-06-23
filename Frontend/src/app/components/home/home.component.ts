import { Component, OnInit } from '@angular/core';
import { ClientService } from 'src/app/services/client.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  prendas: any;

  constructor(private client: ClientService, private router: Router) {

  }

  ngOnInit(): void {
    this.client.getRequest("http://localhost:10101/productos").subscribe(
      ((response: any) => {
        this.prendas = response.prendas;

      }),
      ((error: any) => {
        console.log(error);

      })
    );
  }

  verPrenda(id: number) {
    console.log(id);
    this.router.navigate(['/detalle-prenda', id]);
  }
}
