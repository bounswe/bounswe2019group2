import React from 'react'
import { Icon } from 'antd'

import './footer.scss'

const Footer = () => {
    return (
        <div className="footer-container">
            <div className="copyright">
                Copyright © 2019. All Rights Reserved.
        </div>
            <div className="icons">
                <a href="https://www.twitter.com"><Icon type="twitter" /></a>
                <a href="https://www.facebook.com"><Icon type="facebook" /></a>
                <a href="https://www.instagram.com"><Icon type="instagram" /></a>


            </div>

        </div>

    );

};

export default Footer;