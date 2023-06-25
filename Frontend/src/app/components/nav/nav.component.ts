import { Component, OnInit } from '@angular/core';
import { ClientService } from 'src/app/services/client.service';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent implements OnInit {

  nombre: string;

  constructor(private client: ClientService) {

  }

  ngOnInit(): void {
    this.client.getRequest(`http://localhost:10101/nav`).subscribe(
      ((response: any) => {

        this.nombre = response.usuario[0].nombre;

        // console.log("aa" + this.nombre);

      }),
      ((error: any) => {
        console.log(error.error.Status);
        console.log(error);

      })
    );
  }

  cerrarSesion() {
    this.client.getRequest(`http://localhost:10101/salir`).subscribe(
      ((response: any) => {

        // console.log("aa" + this.nombre);

        console.log(response);

      }),
      ((error: any) => {
        console.log(error.error.Status);
        console.log(error);

      })
    );
  }
}
