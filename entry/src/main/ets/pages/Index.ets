import contactsIndex from '../component/indexComponent/contactsIndex'
import messageIndex from '../component/indexComponent/messageIndex'
import myIndex from './myindex/myIndex'
import OfficeWork from './officeWork/officeWork'

class tabBarItem{
  id:number
  text:string
  icon:ResourceStr


  constructor(id:number,text:string,icon:ResourceStr) {
    this.id=id
    this.text=text
    this.icon=icon
  }
}


@Entry
@Component
struct Index {
  @Provide currentIndex:number = 0;

  tabBarItems:tabBarItem[]=[
    {id:0,text:'办公',icon:$r('app.media.Launch')},
    {id:1,text:'消息',icon:$r('app.media.message')},
    {id:2,text:'通讯录',icon:$r('app.media.email')},
    {id:3,text:'我的',icon:$r('app.media.user')},
  ]


  build() {
    Tabs({barPosition:BarPosition.End}){
      ForEach(this.tabBarItems,(item,index)=>{
        TabContent(){
          this.TabContentBuild({id:item.id})
        }.tabBar(this.tabBarStyle({id:item.id,text:item.text,icon:item.icon}))

      })
    }
    .onChange(index=>{
      this.currentIndex = index;
    })
    .width('100%')
  }

  //自定义tabBar
  @Builder tabBarStyle($$:{id:number,text:string,icon:Resource}){
    if($$.id===1){
      Badge({
        value:'',
        style:{}
      }){
        Column(){
          if (this.currentIndex === $$.id) {
            Image($$.icon).width(20)
              .fillColor(Color.Blue)
            Text($$.text).margin({top:5})
              .fontColor(Color.Blue)
          }else{
            Image($$.icon).width(20)
            Text($$.text).margin({top:5})
          }
        }
      }
    }else{
      Column(){
        if (this.currentIndex === $$.id) {
          Image($$.icon).width(20)
            .fillColor(Color.Blue)
          Text($$.text).margin({top:5})
            .fontColor(Color.Blue)
        }else{
          Image($$.icon).width(20)
          Text($$.text).margin({top:5})
        }
      }
    }
  }

  //页面TabContentBuild
  @Builder TabContentBuild($$:{id:number}){
    if($$.id===0){
      OfficeWork()
    }else if($$.id===1){
      messageIndex()
    }else if($$.id===2){
      contactsIndex()
    }else{
      myIndex()
    }
  }

}