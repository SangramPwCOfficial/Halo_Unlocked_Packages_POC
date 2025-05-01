/**
 * @description       : 
 * @author            : Sangram Keshari Upadhyaya
 * @group             : 
 * @last modified on  : 26-04-2025
 * @last modified by  : Sangram Keshari Upadhyaya
 * Modifications Log
 * Ver   Date         Author                      Modification
 * 1.0   26-04-2025   Sangram Keshari Upadhyaya   Initial Version
**/
import { LightningElement, api } from 'lwc';
export default class DemoProjectTile extends LightningElement {
    @api name;
    @api status;
}