using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentPlan.DataModel;

namespace StudentPlan.Classes
{
    public class BasePage : System.Web.UI.Page
    {
        private UniversalEntities entity;

        public readonly UniversalEntities DataContext
        { 
            get 
            {
                if(entity == null || entity.IsDisposed)
                {
                    entity = new UniversalEntities();
                }
                return entity;
            }  
        }

        public override void Dispose()
        {
            base.Dispose();
            if (DataContext == null || DataContext.IsDisposed)
            {
                DataContext.Dispose();
            }
        }

    }

    public partial class UniversalEntities
    {
        private bool isDisposed;

        public readonly bool IsDisposed
        {
            get
            {
                return isDisposed;
            }
        }

        public override void Dispose()
        {
            Dispose();
            isDisposed = true;
        }
    }
}