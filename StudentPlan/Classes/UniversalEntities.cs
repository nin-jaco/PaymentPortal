using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StudentPlan.DataModel;
using System.Data;

namespace StudentPlan.Classes
{
    public partial class UniversalEntities
    {
        /// <summary>
        /// ObjectContext HttpContext item key name.
        /// </summary>
        private const string HttpContextItemKey = "UniversalEntities";

        /// <summary>
        /// Gets the ObjectContext for the current request. Creates a new one if one does not already exist or is disposed.
        /// </summary>
        /// <returns>The ObjectContext for the current request.</returns>
        public static UniversalEntities Current
        {
            get
            {
                var context = HttpContext.Current.Items[HttpContextItemKey] as UniversalEntities;
                if (null == context || context.IsDisposed)
                {
                    context = new UniversalEntities();
                    HttpContext.Current.Items[HttpContextItemKey] = context;
                }

                return context;
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether this object has been disposed.
        /// </summary>
        public bool IsDisposed { get; private set; }

        /// <summary>
        /// Releases the resources used by the object context.
        /// </summary>
        /// <param name="disposing">true to release both managed and unmanaged resources, false to realse only unmanaged resources.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && !this.IsDisposed)
            {
                this.EndChangeTracking(EntityState.Unchanged);
                if ((HttpContext.Current.Items[HttpContextItemKey] as UniversalEntities) == this)
                {
                    HttpContext.Current.Items.Remove(HttpContextItemKey);
                }
            }

            base.Dispose(disposing);
            this.IsDisposed = true;
        }

    }
}