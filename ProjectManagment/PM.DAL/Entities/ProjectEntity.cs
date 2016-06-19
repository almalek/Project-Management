﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PM.DAL.Entities
{
    /// <summary>
    /// Project entity.
    /// </summary>
    public class ProjectEntity
    {
        #region Properties

        /// <summary>
        /// Gets or sets the id.
        /// </summary>
        /// <value>The id.</value>
        public Guid Id { get; set; }

        /// <summary>
        /// Gets or sets the owner id.
        /// </summary>
        /// <value>The owner id.</value>
        public Guid OwnerId { get; set; }

        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        /// <value>The name.</value>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the description.
        /// </summary>
        /// <value>The description.</value>
        public string Description { get; set; }

        /// <summary>
        /// Gets or sets the date created.
        /// </summary>
        /// <value>The date created.</value>
        public DateTime DateCreated { get; set; }

        /// <summary>
        /// Gets or sets the date updated.
        /// </summary>
        /// <value>The date updated.</value>
        public DateTime DateUpdated { get; set; }

        #endregion Properties
    }
}
