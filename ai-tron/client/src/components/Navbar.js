import React from "react";
import { Link } from "react-router-dom";
import './Navbar.css';
import '../routes/Styles/Responsive.css'

const Navbar = () => {
 
    const navStyle = {
        padding: '1rem 0 1rem 1rem',
        borderTop: 'solid 1px #FF1138',
        textAlign: 'left',
        marginTop: '8rem'
    };

    const tagA = {
        // margin: '0 2rem',
        textDecoration: 'none',
        color: '#FF1138'
    }



    return (
        <nav style={navStyle} className="link">
            <Link to='/' style={tagA} className="link linka">Inicio</Link>
            <Link to='/sobre' style={tagA} className="link linka">Sobre</Link>
            <Link to='/anuncio' style={tagA} className="link linka">Anuncio</Link>
        </nav>
    )
}

export default Navbar;